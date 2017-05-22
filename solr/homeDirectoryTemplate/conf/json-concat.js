// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html

function fieldLookup(doc, field_name, field_alias, last) {
  last = (typeof last !== 'undefined') ? last : false;

  var vals = doc.getFieldValues(field_name);

  var json_txt = '\"' + field_alias + '\":';

  if ( vals !== null ) {
    json_txt += '[' ;
    
    for (var i = 0; i < vals.length; i++) {
      json_txt += vals[i] + ',';
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

  json_txt += addSingleValuedField(doc, 'affiliations_text', 'affiliations_text');
  json_txt += addSingleValuedField(doc, 'awards', 'awards');
  json_txt += addSingleValuedField(doc, 'funded_research', 'funded_research');
  json_txt += addSingleValuedField(doc, 'research_statement', 'research_statement');
  json_txt += addSingleValuedField(doc, 'email_s', 'email');
  json_txt += fieldLookup(doc, 'affiliations_json', 'affiliations');
  json_txt += fieldLookup(doc, 'contributor_to_json', 'contributor_to');
  json_txt += fieldLookup(doc, 'education_json', 'education');
  json_txt += fieldLookup(doc, 'on_the_web_json', 'on_the_web', last=true);

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
