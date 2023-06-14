from tciaclient.core import TCIAClient
tc = TCIAClient()
collection_name = "Pancreas_CT"
series = tc.get_series(collection=collection_name, modality="CT")
download_path = "./tcia-downloads"
for i, s in enumerate(series):
    print(i)
    tc.get_image(seriesInstanceUid = s["SeriesInstanceUID"], downloadPath = download_path, zipFileName = str(i).zfill(3)+"-"+collection_name+".zip")
