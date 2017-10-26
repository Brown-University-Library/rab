// https://wiki.apache.org/solr/ScriptUpdateProcessor
// https://lucene.apache.org/solr/4_7_0/solr-core/org/apache/solr/update/processor/StatelessScriptUpdateProcessorFactory.html
// https://lucene.apache.org/solr/4_2_1/solr-solrj/org/apache/solr/common/SolrInputDocument.html

function recordTypeCheck(rdfTypeArray) {
  var out = 'UNCATEGORIZED';

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
  var doc, uri, rdfTypeArray, record_type;

  logger.info("Adding derived fields");

  doc = cmd.solrDoc;
  uri = doc.getFieldValue('URI');
  if ( uri === null ) {
    logger.error('URI field missing');
    return true;
  }
  doc.addField('id', uri);
  doc.addField('doc_id', uri);

  rdfTypeArray = doc.getFieldValues('type');
  if ( rdfTypeArray === null ) {
    rdfTypeArray = [];
  }
  record_type = recordTypeCheck(rdfTypeArray);

  logger.info('Adding record type ' + record_type);
  doc.addField( 'record_type', record_type );

  logger.info('Added derived fields for ' + uri);
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
