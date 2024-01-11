require "google/cloud/storage"

storage = Google::Cloud::Storage.new(
    project_id: "uploader-dbb4f"
)
bucket_name = "prodpho-bucket"
$storage_bucket = storage.bucket(bucket_name)
bucket.files.each { |file| puts file.name }