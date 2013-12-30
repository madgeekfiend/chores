# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getCompletionText = (val) ->
  if val == true
    return 'Done'
  else
    return 'Not Done'

$ ->
  $('#new_chore').on("ajax:success", (e,data,status,xhr) ->
    $('#new_chore :input[id=chore_name]').val('')
    table = $('#chore-table')
    table.append("<tr data-chore-id=#{data.id}><td>#{data.name}</td><td>#{getCompletionText(data.isDone)}</td><td><a data-method='delete' href='/lists/#{data.list_id}/chores/#{data.id}' rel='nofollow'>Delete</a></td></tr>")
  )

  $('#new_penalty').on("ajax:success", (e,data,status,xhr) ->
    $('#new_penalty :input[id=penalty_name]').val('')
    $('#new_penalty :input[id=penalty_amount]').val('2.00')
    table = $('#penalty-table')
    created_date = new Date(data.created_at)
    amount = Number(data.amount).toFixed(2)
    table.append("<tr><td>#{data.name}</td><td>#{created_date.toString('MM/dd/yyyy')}</td><td>$#{amount}</td></tr>")
  )

  $('#new_notification').on("ajax:success", (e,data,status,xhr) ->
    #Clear out boxes
    $('#new_notification :input[id=notification_phone]').val('')
    $('#new_notification :input[id=notification_role]').val('choree')
    # Notifications table
    table = $('#notifications-table')
    table.append("<tr><td>#{data.phone}</td><td>#{data.role}</td></tr>")
  )

  $('button[id=chore-button]').click( ->
    chore_id = $(this).data('chore-id')
    list_id = $(this).data('list-id')

    $.post('chores/completed',
      { 'chore_id': chore_id, 'list_id': list_id},
      (data,status,xhr)->
        cells = $("#chore-table tr[data-chore-id=#{chore_id}] td")
        $(cells[1]).replaceWith('<td>Done</td>')
        $(cells[2]).replaceWith('<td></td>')
    )
  )

  $('#close-pay-button').click(->
    # Now submit this
    form_data = $('#close-form').serialize()
    action = $('#close-form').attr('action')
    $.post(
      action,
      form_data,
      (data,status,xhr)->
        window.location.reload(true)
    )
    $('#close-form')[0].reset()

  )