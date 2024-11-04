include "module-utils";

{
  "$schema": "./aosd.schema.json",
  directDependencies: [range(1; (.components | length))] | map(tostring),
  dependencies: .components | to_entries | [.[] | map_values(.) | .value.name as $currentName |
    {
      id: (.key + 1) | tostring,
      name: .value.name,
      version: .value.version,
      licenses: .value.licenses | [.[] |
        {
          spdxId: (if .license | has("id") then .license.id else getCustomSpdx($currentName) end), text: (if .license | has("id") then getLicenseText(.license.id) else getLicenseText(getCustomSpdx($currentName)) end)
        }],
      parts: [{name: "default", providers: []}],
      deployPackage: {name: "default"}
    }
  ]
}