{
  "$schema": .["$schema"],
  directDependencies: .directDependencies,
  dependencies: .dependencies | [.[] | {
    id: .id, 
    name: .name, 
    version: .version, 
    licenses: (.licenses | sort_by(.tempPrio) | .[0:1] | map(del(.tempPrio))),
    parts: .parts, 
    deployPackage: .deployPackage}]
}