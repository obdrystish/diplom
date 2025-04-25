$(document).ready(() => {
  // Close messages
  $(".message__close").on("click", function () {
    $(this).parent().fadeOut()
  })

  // Auto-hide messages after 5 seconds
  setTimeout(() => {
    $(".message").fadeOut()
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
          $(".cart-count").text(response.cart_count)

          // Show success message
          const message = $(
            '<div class="message message--success">' +
              response.message +
              '<button class="message__close"><i class="fas fa-times"></i></button></div>',
          )
          $(".messages").append(message)

          // Auto-hide message after 3 seconds
          setTimeout(() => {
            message.fadeOut()
          }, 3000)
        }
      },
    })
  })

  // Update cart quantity
  $(".cart-item-quantity").on("change", function () {
    const form = $(this).closest("form")
    form.submit()
  })

  // Cart update form
  $(".cart-update-form").on("submit", function (e) {
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
          $(".cart-count").text(response.cart_count)

          // Update item total
          const itemId = form.data("item-id")
          $("#item-total-" + itemId).text(response.item_total.toFixed(2) + " ₽")

          // Update cart total
          $(".cart-total").text(response.total.toFixed(2) + " ₽")

          // If quantity is 0, remove the item
          if (Number.parseInt(form.find(".cart-item-quantity").val()) === 0) {
            $("#cart-item-" + itemId).fadeOut(function () {
              $(this).remove()
            })
          }
        }
      },
    })
  })

  // Remove from cart
  $(".cart-remove-form").on("submit", function (e) {
    e.preventDefault()

    const form = $(this)
    const url = form.attr("action")

    $.ajax({
      type: "POST",
      url: url,
      data: form.serialize(),
      success: (response) => {
        if (response.status === "success") {
          // Update cart count
          $(".cart-count").text(response.cart_count)

          // Update cart total
          $(".cart-total").text(response.total.toFixed(2) + " ₽")

          // Remove item from DOM
          const itemId = form.data("item-id")
          $("#cart-item-" + itemId).fadeOut(function () {
            $(this).remove()
          })

          // If cart is empty, show empty message
          if (response.cart_count === 0) {
            $(".cart-items").html('<p class="cart-empty">Ваша корзина пуста</p>')
            $(".cart-summary").hide()
          }
        }
      },
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
})
