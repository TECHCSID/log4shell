# Parcourir le disque à la recherche de JAR liés à Log4J
$jar = @()
$drives = Get-PSDrive -PSProvider 'FileSystem'
foreach($drive in $drives) {
  $jar += Get-ChildItem -Path $Drive.Root -File -ErrorAction SilentlyContinue -Force -Recurse -Filter '*.jar'
}
foreach($line in $jar) {
  if($line -match 'log4j'){
    $path = $line.FullName
    Write-Output "DEBUG:Potential log4j candidate on '$path'"
  }
}
