include "module-utils";

{
  "$schema": .["$schema"],
  directDependencies: .directDependencies,
  dependencies: .dependencies | [.[] | .licenses as $currentLicenses | {
    id: .id, 
    name: .name, 
    version: .version, 
    licenses: .licenses,
    parts: .parts | [
        .[] | {
            name: .name,
            providers: [{
                additionalLicenses: $currentLicenses,
                modified: false,
                usage: "static_linking"
            }],
            external: .external
        }
    ], 
    deployPackage: .deployPackage}]
}