// scalar.q
// Examples of serializing from and deserializing to scalar kdb+ data (atom)

-1"\n+----------|| scalar.q ||----------+\n";

// import the Protobuf library
\l ../q/protobufkdb.q

// Move into the protobufkdb namespace
\d .protobufkdb

//-------------------------------------//
// Example-1. Use compiled schema file //
//-------------------------------------//

// Show embeded schema of ScalarExample message
.protobufkdb.displayMessageSchema[`ScalarExample];

// Prepare scalar (atom) data
scalars:(12i;55f;`str);

// Serialize data into char array
serialized:.protobufkdb.serializeArray[`ScalarExample; scalars];
show serialized;

// Deserialize char array into kdb+ data
deserialized:.protobufkdb.parseArray[`ScalarExample; serialized];
show deserialized;

//-------------------------------------------------//
// Example-2. Use dynamically imported schema file //
//-------------------------------------------------//

// Add impot path of schema file for dynamic schema import
.protobufkdb.addProtoImportPath["../proto"];

// Import schema file
.protobufkdb.importProtoFile["examples_dynamic.proto"];

// Display imported schema of ScalarExampleDynamic message
.protobufkdb.displayMessageSchema[`ScalarExampleDynamic];

// Prepare scalar data
scalars:(12i;55f;`str);

// Serialize data into char array
serialized:.protobufkdb.serializeArray[`ScalarExampleDynamic; scalars];
show serialized;

// Deserialize char array into kdb+ data
deserialized:.protobufkdb.parseArray[`ScalarExampleDynamic; serialized]
show deserialized;

-1 "\n+----------------------------------------+\n";

// Process off
exit 0;