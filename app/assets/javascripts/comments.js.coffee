# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $("a.already-deleted-button").click ->
      event.preventDefault()
      comment_id = $(this).attr("data-commentid")
      button = $(this)
      $.ajax({
          type: "POST",
          url: "/comments/" + comment_id + "/markDeleted",
          data: {},
          success:(data) ->
            if data == "success"
              button.parent().parent().remove()
          error:(data) ->
            alert(data)
      })
  $("a.invalid-button").click ->
      event.preventDefault()
      comment_id = $(this).attr("data-commentid")
      button = $(this)
      $.ajax({
          type: "POST",
          url: "/comments/" + comment_id + "/markInvalid",
          data: {},
          success:(data) ->
            if data == "success"
              button.parent().parent().remove()
          error:(data) ->
            alert(data)
      })
  $("a.valid-button").click ->
      event.preventDefault()
      comment_id = $(this).attr("data-commentid")
      button = $(this)
      $.ajax({
          type: "POST",
          url: "/comments/" + comment_id + "/markValid",
          data: {},
          success:(data) ->
            console.log(data)
            if data == "success"
              button.parent().parent().remove()
          error:(data) ->
            alert(data)
      })
