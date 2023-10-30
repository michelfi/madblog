document.addEventListener('DOMContentLoaded', function() {
  const postForm = document.getElementById('post-form');
  if (postForm) {
    const imageInput = postForm.querySelector('#image-input');
    const imagePreview = document.getElementById('image-preview');

    console.log('Script started');

    if (imageInput) {
      imageInput.addEventListener('change', function() {
        console.log('Change event triggered');
        const file = imageInput.files[0];

        if (file) {
          const reader = new FileReader();
          reader.onload = function(e) {
            console.log('Image loaded');
            imagePreview.src = e.target.result;
          };
          reader.readAsDataURL(file);
        } else {
          console.log('No file selected');
          imagePreview.src = '';
        }
      });
    }
  }
});
