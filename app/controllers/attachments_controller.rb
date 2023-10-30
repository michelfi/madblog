class AttachmentsController < ApplicationController
  def create
    uploaded_file = params[:file]

    # Créez une instance ActiveStorage::Blob pour stocker le fichier
    blob = ActiveStorage::Blob.create_and_upload!(
      io: uploaded_file.tempfile,
      filename: uploaded_file.original_filename,
      content_type: uploaded_file.content_type
    )

    # Renvoyez la réponse JSON appropriée avec l'URL de la pièce jointe
    render json: { url: rails_blob_path(blob, only_path: true) }
  end
end
