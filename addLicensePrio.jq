include "module-utils";

{
  "$schema": .["$schema"],
  directDependencies: .directDependencies,
  dependencies: .dependencies | [.[] | {
    id: .id, 
    name: .name, 
    version: .version, 
    licenses: .licenses | [.[] | {
        spdxId: .spdxId,
        text: .text,
        tempPrio: getLicensePrio(.spdxId)
    }], 
    parts: .parts, 
    deployPackage: .deployPackage}]
}