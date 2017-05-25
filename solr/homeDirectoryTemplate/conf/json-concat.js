// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html

function addMultiValuedField(doc, field_name, field_alias, text_data, last) {
  last = (typeof last !== 'undefined') ? last : false;
  text_data = (typeof text_data !== 'undefined') ? text_data : false;

  var vals = doc.getFieldValues(field_name);

  var json_txt = '\"' + field_alias + '\":';

  if ( vals !== null ) {
    json_txt += '[' ;
    
    for (var i = 0; i < vals.length; i++) {
      var val;

      if ( text_data ) {
        val = '\"' + vals[i] + '\"';
      } else {
        val = vals[i];
      }
      json_txt += val + ',';
    }

    json_txt = json_txt.slice(0,-1);
    json_txt += ']';
  }
  else {
    json_txt += '[]';
  }

  if ( !(last) ) {
    json_txt += ',';
  }

  return json_txt;
}

function addSingleValuedField(doc, field_name, field_alias, last ) {
  last = (typeof last !== 'undefined') ? last : false;

  var val = doc.getFieldValue(field_name);

  var json_txt = '\"' + field_alias + '\":';

  if ( val !== null ) {
    json_txt += '\"' + val + '\"';
  } else {
    json_txt += '\"\"';
  }

  if ( !(last) ) {
    json_txt += ',';
  }

  return json_txt;
}

function processAdd(cmd) {
  var doc, id, json_txt;

  doc = cmd.solrDoc;

  json_txt = '';

  json_txt += addSingleValuedField(doc, 'URI', 'id');
  json_txt += addSingleValuedField(doc, 'URI', 'uri');
  json_txt += addSingleValuedField(doc, 'THUMBNAIL_URL', 'thumbnail');

  json_txt += addSingleValuedField(doc, 'affiliations_text', 'affiliations_text');
  json_txt += addSingleValuedField(doc, 'awards', 'awards');
  json_txt += addSingleValuedField(doc, 'department_t', 'org_label');
  json_txt += addSingleValuedField(doc, 'email_s', 'email');
  json_txt += addSingleValuedField(doc, 'funded_research', 'funded_research');
  json_txt += addSingleValuedField(doc, 'name_t', 'name');
  json_txt += addSingleValuedField(doc, 'overview_t', 'overview');
  json_txt += addSingleValuedField(doc, 'research_overview', 'research_overview');
  json_txt += addSingleValuedField(doc, 'research_statement', 'research_statement');
  json_txt += addSingleValuedField(doc, 'scholarly_work', 'scholarly_work');
  json_txt += addSingleValuedField(doc, 'teaching_overview', 'teaching_overview');
  json_txt += addSingleValuedField(doc, 'title_t', 'title');

  json_txt += addMultiValuedField(doc, 'published_in', 'published_in', true);
  json_txt += addMultiValuedField(doc, 'research_areas', 'research_areas', true);
  json_txt += addMultiValuedField(doc, 'teacher_for', 'teacher_for', true);

  json_txt += addMultiValuedField(doc, 'cv_json', 'cv');
  json_txt += addMultiValuedField(doc, 'affiliations_json', 'affiliations');
  json_txt += addMultiValuedField(doc, 'collaborators_json', 'collaborators');
  json_txt += addMultiValuedField(doc, 'contributor_to_json', 'contributor_to');
  json_txt += addMultiValuedField(doc, 'education_json', 'education');
  json_txt += addMultiValuedField(doc, 'appointments_json', 'appointments');
  json_txt += addMultiValuedField(doc, 'credentials_json', 'credentials');
  json_txt += addMultiValuedField(doc, 'training_json', 'training');
  json_txt += addMultiValuedField(doc, 'on_the_web_json', 'on_the_web', false, true);

  doc.addField( 'json_txt', json_txt );
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
