// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html


function processAdd(cmd) {

  var doc, id,
      recognized_types, rtype,
      applicable, relevant_fields,
      field_mappings, mappings,
      single_valued_fields,
      i_relv;

  logger.info("Mapping Solr fields");

  recognized_types = ['PEOPLE', 'ORGANIZATION'];
  doc = cmd.solrDoc;
  rtype = doc.getFieldValues('record_type');

  if ( rtype === null || recognized_types.indexOf(rtype[0]) === -1 ) {
    logger.info('Doc type ' + rtype[0] + ' is not configured for field mapping. Returning');
    return true;
  } else {
    logger.info('Mapping Solr fields for document of type ' + rtype[0]);
  }

  applicable = {
    'PEOPLE' : [
      'person_shortid','person_department_affiliations',
      'person_primary_department','person_email','person_label',
      'person_overview','person_title','person_published_in',
      'person_research_areas','person_alumni_of',
      'person_teacher_for', 'person_image_path',
      'person_full_name'
    ],
    'ORGANIZATION' : [
      'organization_image_path'
    ]
  };

  field_mappings = {
    'PEOPLE' : {
      'person_email' : 'email_s',
      'person_title' : 'title_t',
      'person_label' : 'name_t',
      'person_primary_department' : 'department_t',
      'person_overview' : 'overview_t',
      'person_shortid' : 'short_id_s',
      'person_department_affiliations' : 'affiliations',
      'person_research_areas' : 'research_areas',
      'person_published_in' : 'published_in',
      'person_alumni_of' : 'alumni_of',
      'person_teacher_for' : 'teacher_for',
      'person_image_path' : 'thumbnail_file_path_s',
      'person_full_name' : 'display_name_s'
    },
    'ORGANIZATION' : {
      'organization_image_path' : 'thumbnail_file_path_s'
    }
  }

  single_valued_fields = [
    'person_email', 'person_shortid', 'person_image_path',
    'organization_image_path', 'person_full_name'
  ];

  relevant_fields = applicable[rtype[0]];
  mappings = field_mappings[rtype[0]];

  id = doc.getFieldValue('id');
  logger.info(id + " : mapping Solr fields");

  for (i_relv=0; i_relv < relevant_fields.length; i_relv++) {
    var field, data, mapped,
      data_count, i_map;

    field = relevant_fields[i_relv];
    mapped = mappings[field];
    data = doc.getFieldValues(field);
    logger.info(id + " : mapping " + field + " to " + mapped);

    if ( data === null ) {
      logger.info(id + " : " + field + " is empty");
      continue ;
    }

    if ( single_valued_fields.indexOf(field) !== -1 ) {
      data_count = 1;
    } else {
      data_count = data.length;
    }

    for (i_map=0; i_map < data_count; i_map++) {
      doc.addField(mapped, data[i_map]);
    }
  }

  logger.info(id + " : successfully mapped Solr fields");
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
