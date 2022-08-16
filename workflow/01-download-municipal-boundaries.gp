# Download municipal boundaries:
# - read from the zipped shapefile on the State Demography Office
# - convert to GeoJSON
CreateFolder(Folder="downloads",CreateParentFolders="True",IfFolderExists="Ignore")
CreateFolder(Folder="../data/latest",CreateParentFolders="True",IfFolderExists="Ignore")
# Previously used:
# WebGet(URL="https://data.colorado.gov/resource/w6jq-7em5.geojson",OutputFile="downloads/municipal-boundaries.geojson",Timeout="10")
#
# Worked on 2022-08-16.
WebGet(URL="https://storage.googleapis.com/co-publicdata/MuniBounds.zip",OutputFile="downloads/MuniBounds.zip")
# Unzip the zip file
UnzipFile(File="downloads/MuniBounds.zip",OutputFolder="downloads/MuniBounds",IfFolderDoesNotExist="Create")
ReadGeoLayerFromShapefile(InputFile="downloads/MuniBounds/MuniBounds.shp",GeoLayerID="MuniBoundsLayer",Name="Municipal Boundaries",Description="Municipal boundaries")
#
# Write out a layer with all boundaries.
WriteGeoLayerToGeoJSON(GeoLayerID="MuniBoundsLayer",OutputFile="../data/latest/co-municipal-boundaries.geojson")