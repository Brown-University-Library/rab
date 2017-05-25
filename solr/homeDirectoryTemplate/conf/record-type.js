// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html

function recordTypeCheck(rdfTypeArray) {
  var out = null;

  for (var i = 0; i < rdfTypeArray.length; i++) {
    var val = rdfTypeArray[i];

    if ( val === 'http://xmlns.com/foaf/0.1/Person' ) {
      out = 'PEOPLE';
      break;
    } 
    else if ( val === 'http://xmlns.com/foaf/0.1/Organization' ) {
      out = 'ORGANIZATION';
      break;
    }
  }

  return out;
}

function processAdd(cmd) {
  var doc, rdfTypeArray, record_type;

  doc = cmd.solrDoc;

  rdfTypeArray = doc.getFieldValues('type');

  record_type = recordTypeCheck(rdfTypeArray);

  if ( record_type !== null) {
    doc.addField( 'record_type', record_type );
  }
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
