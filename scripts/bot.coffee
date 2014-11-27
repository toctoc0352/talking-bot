words = process.env.HUBOT_WORDS or '{}'
wordsJson = JSON.parse words
matchWords = Object.keys wordsJson
regStr = matchWords.join('|')
reg = new RegExp(regStr, 'i')

onHearCallBack = (msg) ->
    text = msg.message.text
    word = wordsJson[text]
    if word?
      msg.send word

module.exports = (robot) ->
    robot.hear reg, onHearCallBack
