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

  $('a[data-remote=true].chore').on('ajax:success', (e,data,status,xhr)->
    $("#chore-table tr[data-chore-id=#{data.id}]").remove()
  )