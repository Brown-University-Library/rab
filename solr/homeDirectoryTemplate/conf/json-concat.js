// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html

function fieldLookup(doc, json_txt, field_name, field_alias, last) {
  last = (typeof last !== 'undefined') ? last : false;

  var vals = doc.getFieldValues(field_name)

  json_txt += '\"' + field_alias + '\":';

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

function processAdd(cmd) {
  var doc, id, json_txt;

  doc = cmd.solrDoc;

  json_txt = '';

  json_txt += fieldLookup(doc, json_txt, 'affiliations_json', 'affiliations');
  json_txt += fieldLookup(doc, json_txt, 'contributor_to_json', 'contributor_to');
  json_txt += fieldLookup(doc, json_txt, 'education_json', 'education');
  json_txt += fieldLookup(doc, json_txt, 'on_the_web_json', 'on_the_web', last=true);

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
