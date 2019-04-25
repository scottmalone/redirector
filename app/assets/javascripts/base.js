const redirector = {
  setup: function() {
    redirector.bindNewShortLink();
  },

  bindNewShortLink: function() {
    $("#new-short-link-form").submit(function(e) {
      const form = $(this);
      const url = form.attr('action');

      $.ajax({
        type: "POST",
        url: url,
        data: form.serialize(),
        success: function(response) {
          const redirectUrl = response.data.attributes["redirect_url"];
          redirector.showResults(redirectUrl);
          $(':input[type="submit"]').prop('disabled', false);
        }
      });

      e.preventDefault();
    });
  },

  showResults: function(redirectUrl) {
    const resultTemplate = JST['templates/short_links/result'];
    const html = resultTemplate({
      redirect_url: redirectUrl
    });
    $('#result-container').html(html);
  }
};
