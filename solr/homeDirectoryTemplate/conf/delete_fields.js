// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html



function processAdd(cmd) {

  var doc, id,
      recognized_types, rtype,
      applicable, relevant_fields,
      i_relv;

  logger.info("Removing unused Solr fields");

  recognized_types = ['PEOPLE','ORGANIZATION'];
  doc = cmd.solrDoc;
  rtype = doc.getFieldValues('record_type');

  if ( rtype === null || recognized_types.indexOf(rtype[0]) === -1 ) {
    logger.info('Doc type ' + rtype[0] + ' is not configured for field deletion. Returning');
    return true;
  } else {
    logger.info('Removing Solr fields for document of type ' + rtype[0]);
  }

  applicable = {
    'PEOPLE' : [
      'doc_id','person_affiliations', 'person_image_path',
      'person_awards','person_primary_department',
      'person_email','person_funded_research','person_label',
      'person_overview','person_research_overview',
      'person_research_statement','person_scholarly_work',
      'person_teaching_overview','person_title',
      'person_published_in','person_research_areas',
      'person_teacher_for','person_delimited_cv',
      'person_alumni_of','person_shortid',
      'person_department_affiliations',
      'person_delimited_affiliations',
      'person_delimited_collaborators',
      'person_delimited_contributor_to','person_delimited_education',
      'person_delimited_appointments','person_delimited_credentials',
      'person_delimited_training','person_delimited_on_the_web',
      'person_full_name','person_fis_updated',
      'person_profile_updated', 'person_consent_viz'
    ],
    'ORGANIZATION' : [
      'doc_id',
      'organization_overview','organization_delimited_positions',
      'organization_delimited_on_the_web','organization_label',
      'organization_image_path'
    ]
  };

  relevant_fields = applicable[rtype[0]];

  id = doc.getFieldValue('id');
  logger.info(id + " : removing Solr fields");

  for (i_relv=0; i_relv < relevant_fields.length; i_relv++) {
    var field;

    field = relevant_fields[i_relv];

    logger.info(id + " : removing Solr field " + field);
    doc.removeField( field );
  }

  logger.info(id + " : successfully removed Solr fields");
  return true;
}

function processDelete(cmd) {
}

function processMergeIndexes(cmd) {
}

function processCommit(cmd) {
}

function processRollback(cmd) {
}

function finish() {
}
