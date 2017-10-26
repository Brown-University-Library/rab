// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html


function processAdd(cmd) {

  var doc, id,
      recognized_types, rtype,
      applicable, relevant_fields,
      field_mappings, mappings,
      raw_json_fields, single_valued_fields,
      json_data, json_txt,
      i_relv;

  logger.info("Building JSON data");

  recognized_types = ['PEOPLE','ORGANIZATION'];
  doc = cmd.solrDoc;
  rtype = doc.getFieldValues('record_type');

  if ( rtype === null || recognized_types.indexOf(rtype[0]) === -1 ) {
    logger.info('Doc type ' + rtype[0] + ' is not configured for JSON building. Returning');
    return true;
  } else {
    logger.info('Building JSON data for document of type ' + rtype[0]);
  }

  applicable = {
    'PEOPLE' : [
      'doc_id','THUMBNAIL_URL','record_type',
      'person_affiliations','person_awards','person_primary_department',
      'person_email','person_funded_research','person_label',
      'person_overview','person_research_overview',
      'person_research_statement','person_scholarly_work',
      'person_teaching_overview','person_title',
      'person_published_in','person_research_areas',
      'person_teacher_for','person_delimited_cv',
      'person_delimited_affiliations',
      'person_delimited_collaborators',
      'person_delimited_contributor_to','person_delimited_education',
      'person_delimited_appointments','person_delimited_credentials',
      'person_delimited_training','person_delimited_on_the_web'
    ],
    'ORGANIZATION' : [
      'doc_id','THUMBNAIL_URL','record_type',
      'organization_overview','organization_delimited_positions',
      'organization_delimited_on_the_web','organization_label'
    ]
  };

  field_mappings = {
    'PEOPLE' : {
      'doc_id':['id','uri'],
      'THUMBNAIL_URL':'thumbnail',
      'record_type':'record_type',
      'person_affiliations':'affiliations_text',
      'person_awards':'awards',
      'person_primary_department':'org_label',
      'person_email':'email',
      'person_funded_research':'funded_research',
      'person_label':'name',
      'person_overview':'overview',
      'person_research_overview':'research_overview',
      'person_research_statement':'research_statement',
      'person_scholarly_work':'scholarly_work',
      'person_teaching_overview':'teaching_overview',
      'person_title':'title',
      'person_published_in':'published_in',
      'person_research_areas':'research_areas',
      'person_teacher_for':'teacher_for',
      'person_delimited_cv':'cv',
      'person_delimited_affiliations':'affiliations',
      'person_delimited_collaborators':'collaborators',
      'person_delimited_contributor_to':'contributor_to',
      'person_delimited_education':'education',
      'person_delimited_appointments':'appointments',
      'person_delimited_credentials':'credentials',
      'person_delimited_training':'training',
      'person_delimited_on_the_web':'on_the_web'}
    ,
    'ORGANIZATION' : {
      'doc_id':['id','uri'],
      'THUMBNAIL_URL':'thumbnail',
      'record_type':'record_type',
      'organization_overview':'overview',
      'organization_delimited_positions':'people',
      'organization_delimited_on_the_web':'web_pages',
      'organization_label':'name'}
  };

  raw_json_fields = [
    'person_delimited_cv','person_delimited_affiliations',
    'person_delimited_collaborators',
    'person_delimited_contributor_to','person_delimited_education',
    'person_delimited_appointments','person_delimited_credentials',
    'person_delimited_training','person_delimited_on_the_web',
    'organization_delimited_positions',
    'organization_delimited_on_the_web'
  ];

  single_valued_fields = [
    'doc_id','THUMBNAIL_URL','record_type',
    'person_affiliations','person_awards','person_primary_department',
    'person_email','person_funded_research','person_label',
    'person_overview','person_research_overview',
    'person_research_statement','person_scholarly_work',
    'person_teaching_overview','person_title',
    'organization_overview', 'organization_label'
  ];

  relevant_fields = applicable[rtype[0]];
  mappings = field_mappings[rtype[0]];

  id = doc.getFieldValue('id');
  logger.info(id + " : building JSON data");

  json_data = {};
  for (i_relv=0; i_relv < relevant_fields.length; i_relv++) {
    var field, data,
      parsed_data, data_to_write,
      json_field,
      i_raw, i_fld;

    field = relevant_fields[i_relv];
    data = doc.getFieldValues(field);
    logger.info(id + " : adding " + field + " to JSON data");

    json_field = mappings[field];

    if ( data === null ) {
      data = [];
    }

    parsed_data = [];
    if ( raw_json_fields.indexOf(field) !== -1 ) {
      for (i_raw=0; i_raw < data.length; i_raw++) {
        var parsed;

        try {
          parsed = JSON.parse(data[i_raw]);
          parsed_data.push(parsed);
        } catch(e) {
          logger.warn(id + " : failed to parse JSON data in field " + field);
          continue;
        }
      }
    } else {
      for (i_raw=0; i_raw < data.length; i_raw++) {
        parsed_data.push(data[i_raw]);
      }
    }

    if ( single_valued_fields.indexOf(field) !== -1 ) {
      if ( parsed_data.length === 0) {
        data_to_write = "";
      } else {
        data_to_write = parsed_data[0];
      }
    } else {
      data_to_write = parsed_data;
    }

    if (typeof json_field === 'object') {
      for (i_fld=0; i_fld < json_field.length; i_fld++) {
        json_data[json_field[i_fld]] = data_to_write;
        logger.info(id + " : mapped " + field + " to JSON field " + json_field[i_fld]);
      }
    } else {
      json_data[json_field] = data_to_write;
      logger.info(id + " : mapped " + field + " to JSON field " + json_field);
    }
  }

  json_txt = JSON.stringify(json_data);

  logger.info(id + " : successfully built JSON field");
  doc.addField( 'json_txt', json_txt );

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
