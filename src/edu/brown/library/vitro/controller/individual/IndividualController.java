package edu.brown.library.vitro.controller.individual;

import edu.cornell.mannlib.vedit.beans.LoginStatusBean;
import edu.cornell.mannlib.vitro.webapp.auth.permissions.PermissionSets;
import edu.cornell.mannlib.vitro.webapp.beans.Individual;
import edu.cornell.mannlib.vitro.webapp.beans.UserAccount;
import edu.cornell.mannlib.vitro.webapp.beans.VClass;
import edu.cornell.mannlib.vitro.webapp.controller.VitroRequest;
import edu.cornell.mannlib.vitro.webapp.controller.freemarker.responsevalues.ResponseValues;
import edu.cornell.mannlib.vitro.webapp.controller.freemarker.responsevalues.TemplateResponseValues;
import edu.cornell.mannlib.vitro.webapp.controller.individual.IndividualRequestAnalysisContextImpl;
import edu.cornell.mannlib.vitro.webapp.controller.individual.IndividualRequestAnalyzer;
import edu.cornell.mannlib.vitro.webapp.controller.individual.IndividualRequestInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class IndividualController extends edu.cornell.mannlib.vitro.webapp.controller.individual.IndividualController {
    private static final Log log = LogFactory.getLog(IndividualController.class);
    private static final String HIDDEN_CLASS = "http://vivo.brown.edu/ontology/display#Hidden";


    @Override
    protected ResponseValues processRequest(VitroRequest vreq) {
        UserAccount user = LoginStatusBean.getCurrentUser(vreq);
        if ((user == null) || (shouldBlockHiddenClass(user))) {
            //If current user is the root user or a dba (site admin) don't do a check
            IndividualRequestInfo requestInfo = analyzeTheRequest(vreq);
            Individual individual = requestInfo.getIndividual();
            Boolean hidden = isHiddenType(individual);
            log.debug("Individual " + individual + "for user: " + user + " is hidden: " + hidden);
            if (hidden) {
                String template = "individual-hidden-class.ftl";
                Map<String, Object> body = new HashMap<String, Object>();
                body.put("title", "Individual Not Found");
                body.put("errorMessage", "The individual was not found in the system.");
                return new TemplateResponseValues(template, body,
                        HttpServletResponse.SC_GONE);
            }
        }
        //do the normal thing.
        return super.processRequest(vreq);
    }

    private IndividualRequestInfo analyzeTheRequest(VitroRequest vreq) {
        return new IndividualRequestAnalyzer(vreq,
                new IndividualRequestAnalysisContextImpl(vreq)).analyze();
    }

    private boolean shouldBlockHiddenClass(UserAccount user) {
        //If current user is the root user or a dba (site admin) don't do a check
        if (user.isRootUser()) {
            return false;
        }
        if (user.getPermissionSetUris().contains(PermissionSets.URI_DBA)) {
            return false;
        }
        //if we are still here then no
        return true;
    }

    private boolean isHiddenType(Individual individual) {
        //check to see if the requested individual has an attached hidden class
        Boolean isHiddenType = Boolean.FALSE;
        String hiddenType = HIDDEN_CLASS;
        List<VClass> vclasses = individual.getVClasses();
        if (vclasses != null) {
            for (VClass v : vclasses) {
                String typeUri = v.getURI();
                log.debug("Individual: " + individual + " type: " + typeUri);
                if (hiddenType.equals(typeUri)) {
                    isHiddenType = Boolean.TRUE;
                    break;
                }
            }
        }
        return isHiddenType;
    }
}
