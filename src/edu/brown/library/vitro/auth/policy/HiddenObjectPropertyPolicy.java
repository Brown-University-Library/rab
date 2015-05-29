package edu.brown.library.vitro.auth.policy;

import com.hp.hpl.jena.query.*;
import com.hp.hpl.jena.shared.Lock;
import edu.cornell.mannlib.vitro.webapp.auth.identifier.IdentifierBundle;
import edu.cornell.mannlib.vitro.webapp.auth.identifier.common.HasPermissionSet;
import edu.cornell.mannlib.vitro.webapp.auth.identifier.common.IsRootUser;
import edu.cornell.mannlib.vitro.webapp.auth.permissions.PermissionSets;
import edu.cornell.mannlib.vitro.webapp.auth.policy.BasicPolicyDecision;
import edu.cornell.mannlib.vitro.webapp.auth.policy.ServletPolicyList;
import edu.cornell.mannlib.vitro.webapp.auth.policy.ifaces.Authorization;
import edu.cornell.mannlib.vitro.webapp.auth.policy.ifaces.PolicyDecision;
import edu.cornell.mannlib.vitro.webapp.auth.policy.ifaces.PolicyIface;
import edu.cornell.mannlib.vitro.webapp.auth.requestedAction.RequestedAction;
import edu.cornell.mannlib.vitro.webapp.auth.requestedAction.publish.PublishObjectPropertyStatement;
import edu.cornell.mannlib.vitro.webapp.dao.jena.QueryUtils;
import edu.cornell.mannlib.vitro.webapp.servlet.setup.JenaDataSourceSetupBase;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by Ted Lawless on 3/12/15.
 * Prevents objects related to a hidden class from displaying to users
 * who aren't a site admin or root user.
 */
public class HiddenObjectPropertyPolicy implements PolicyIface{
    private static final Log log = LogFactory
            .getLog(HiddenObjectPropertyPolicy.class);

    private final Dataset dataset;
    private static final Syntax SYNTAX = Syntax.syntaxARQ;
    private static final String HIDDEN_CLASS = "http://vivo.brown.edu/ontology/display#Hidden";

    public HiddenObjectPropertyPolicy(ServletContext ctx) {
        this.dataset = JenaDataSourceSetupBase.getStartupDataset(ctx);
    }

    @Override
    public PolicyDecision isAuthorized(IdentifierBundle whoToAuth,
                                       RequestedAction whatToAuth) {
        String objURI = null;

        //pass for root users or dba
        if (IsRootUser.isRootUser(whoToAuth)
                || whoToAuth.contains(PermissionSets.URI_DBA)) {
            return inconclusiveDecision("Root and site admin can view hidden classes");
        }

        //This creates a huge amount of extra queries so we are only going to filter
        //linked data requests a.k. PublishObjectPropertyStatement.  HTML requests
        //will be filtered at the listViewConfig query level.
        if (whatToAuth instanceof PublishObjectPropertyStatement) {
            PublishObjectPropertyStatement stmt = ((PublishObjectPropertyStatement) whatToAuth);
            //see if this subject is of type hidden or if this obj is of type hidden..
            if (relatedToHiddenClass(stmt.getSubjectUri())) {
                return unauthorizedDecision("Type is hidden");
            } else if (relatedToHiddenClass(stmt.getObjectUri())) {

                log.debug("Not authorizing object prop view.");
                return unauthorizedDecision("Related to hidden property");
            }
        }

        return inconclusiveDecision("don't know what to do");
    }

    private static final String QUERY_TEMPLATE = "" + //
            "ASK {" + //
            "     ?uri a <" + HIDDEN_CLASS + "> ." + //
            "} ";

    private Boolean relatedToHiddenClass(String uri) {
        String rq = assembleQueryString(uri);
        return executeQuery(rq);
    }

    private String assembleQueryString(String uri) {
        String q = QUERY_TEMPLATE;
        q = QueryUtils.subUriForQueryVar(q, "uri", uri);
        return q;
    }

    private Boolean executeQuery(String queryStr) {
        log.debug("select query is: '" + queryStr + "'");
        QueryExecution qe = null;
        dataset.getLock().enterCriticalSection(Lock.READ);
        try {
            Query query = QueryFactory.create(queryStr, SYNTAX);
            qe = QueryExecutionFactory.create(query, dataset);
            return qe.execAsk();
        } catch (Exception e) {
            log.error("Failed to execute the ASK query: " + queryStr, e);
            return false;
        } finally {
            if (qe != null) {
                qe.close();
            }
            dataset.getLock().leaveCriticalSection();
        }
    }

    private PolicyDecision inconclusiveDecision(String message) {
        return new BasicPolicyDecision(Authorization.INCONCLUSIVE, getClass()
                .getSimpleName() + ": " + message);
    }

    private PolicyDecision unauthorizedDecision(String message) {
        return new BasicPolicyDecision(Authorization.UNAUTHORIZED, getClass()
                .getSimpleName() + ": " + message);
    }

    public static class Setup implements ServletContextListener {
        @Override
        public void contextInitialized(ServletContextEvent sce) {
            ServletContext ctx = sce.getServletContext();

            ServletPolicyList.addPolicyAtFront(ctx, new HiddenObjectPropertyPolicy(
                    ctx));
        }

        @Override
        public void contextDestroyed(ServletContextEvent sce) { /* nothing */
        }
    }

}
