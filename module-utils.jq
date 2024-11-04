# Returns custom license if license is not given
def getCustomSpdx(packageName): packageName | 
  if contains("camunda") or contains("zeebe") or contains("identity") or contains("webapps") or contains("operate") or contains("tasklist") or contains("optimize") or contains("document-") or contains("bpmn-js") or contains("form-js") or contains("dmn-js")
      then "Commercial" 
    elif contains("parsson") or contains("jakarta.json")
      then "GPL-2.0-with-classpath-exception"
    elif contains("javax.activation-api") or contains("javax.annotation-api")
      then "CDDL-1.1"
    elif contains("bcpkix-jdk18on") or contains("bcutil-jdk18on") or contains("bcprov-jdk18on")
      then "MIT" # see https://www.bouncycastle.org/about/license/#License
    elif contains ("dompurify")
      then "Apache-2.0"
    else "TODO: undefined" end;

# Returns a license prio (e.g., to filter out one if multiple licenses are given)
def getLicensePrio(spdxId):
  if spdxId == "BSD-3-Clause" then 1
  elif spdxId == "EDL-1.0" then 2
  elif spdxId == "ISC" then 3
  elif spdxId == "Apache-2.0" then 4
  elif spdxId == "MIT" then 5
  elif spdxId == "MIT-0" then 6
  elif spdxId == "SAX-PD" then 7
  elif spdxId == "WTFPL" then 8
  elif spdxId == "BSD-2-Clause" then 9
  elif spdxId == "Ruby" then 10
  elif spdxId == "OFL-1.1" then 11
  elif spdxId == "0BSD" then 12
  elif spdxId == "Unlicense" then 13
  elif spdxId == "Unicode-DFS-2016" then 14
  elif spdxId == "UPL-1.0" then 15
  elif spdxId == "CC-BY-SA-3.0" then 16
  elif spdxId == "CC-BY-4.0" then 17
  elif spdxId == "Plexus" then 18
  elif spdxId == "Go" then 19
  elif spdxId == "CDDL-1.0" then 20
  elif spdxId == "CDDL-1.1" then 21
  elif spdxId == "MPL-1.0" then 22
  elif spdxId == "MPL-1.1" then 23
  elif spdxId == "MPL-2.0" then 24
  elif spdxId == "LGPL-2.1" then 25
  elif spdxId == "LGPL-3.0" then 26
  elif spdxId == "EPL-1.0" then 27
  elif spdxId == "EPL-2.0" then 28
  elif spdxId == "W3C" then 29
  elif spdxId == "W3C-20150513" then 30
  elif spdxId == "GPL-2.0-with-classpath-exception" then 31
  elif spdxId == "GPL-3.0" then 32
  elif spdxId == "GPL-2.0" then 33
  elif spdxId == "TMate" then 34
  else 99 end;