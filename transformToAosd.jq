include "module-licenseMapping";

{
  "$schema": "./aosd.schema.json",
  directDependencies: [],
  dependencies: .components | to_entries | [.[] | map_values(.) | .value.name as $currentName |
    {
      id: .key | tostring,
      name: .value.name,
      version: .value.version,
      licenses: .value.licenses | [.[] |
        {
          spdxId: (if .license | has("id") then .license.id else getCustomSpdx($currentName) end), text: "TO BE ADDED"
        }],
      parts: [{name: "default", providers: []}],
      deployPackage: {name: "default"}
    }
  ]
}