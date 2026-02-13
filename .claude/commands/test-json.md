# Test JSON Serialization

Help test JSON serialization/deserialization for SwiftUIML nodes.

## Steps

1. Ask the user what node structure they want to test
2. Create the node using the DSL
3. Serialize to JSON using JSONEncoder with pretty printing
4. Display the JSON output
5. Deserialize back from JSON
6. Verify the decoded node matches the original
7. Optionally create a test case in `Tests/SwiftUIMLTests/SerializationTests.swift`

## Important

- Use `OrderedMultiDictionary` for attributes to maintain order
- Nested nodes should have `$type: "node"` in JSON
- Test both directions: DSL → JSON → DSL
- Attribute order matters for modifier application
