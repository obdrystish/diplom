$(document).ready(() => {
  // Auto-hide alerts after 5 seconds
  setTimeout(() => {
    $(".alert").fadeOut()
  }, 5000)

  // Add to cart functionality
  $(".add-to-cart-form").on("submit", function (e) {
    e.preventDefault()

    const form = $(this)
    const url = form.attr("action")
    const data = form.serialize()

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: (response) => {
        if (response.status === "success") {
          // Update cart count
          $(".badge.bg-danger").text(response.cart_count)

          // Show success message
          const message = $(
            '<div class="alert alert-success alert-dismissible fade show">' +
              response.message +
              '<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>'
          )
          $(".container.mt-3").append(message)

          // Auto-hide message after 3 seconds
          setTimeout(() => {
            message.fadeOut()
          }, 3000)
        }
      },
      error: (xhr) => {
        // Show error message
        const message = $(
          '<div class="alert alert-danger alert-dismissible fade show">' +
            'Произошла ошибка при добавлении товара в корзину' +
            '<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>'
        )
        $(".container.mt-3").append(message)

        // Auto-hide message after 3 seconds
        setTimeout(() => {
          message.fadeOut()
        }, 3000)
      }
    })
  })

  // Product filters
  $(".filter-form input, .filter-form select").on("change", function () {
    $(this).closest("form").submit()
  })

  // Product image gallery
  $(".product-image-thumbnail").on("click", function () {
    const mainImage = $(".product-image-main img")
    const newSrc = $(this).data("src")

    mainImage.fadeOut(300, () => {
      mainImage.attr("src", newSrc).fadeIn(300)
    })
  })

  // Initialize tooltips
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  // Initialize popovers
  const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })
})
