function updateUI(message) {
    $('#vote-count-a').html(message.voteA);
    $('#vote-count-b').html(message.voteB);
  }

function publishNub() {
    
    var votes = { voteA: $('#vote-count-a').text(), voteB: $('#vote-count-b').text() }
    var myChannel = $('.poll-middle').attr('id');

    pubnub = new PubNub({
        publishKey : 'pub-c-b27cbf1e-2eb7-4afb-a302-a09731c859ac',
        subscribeKey : 'sub-c-65665db6-b825-11e6-b38f-02ee2ddab7fe'
    })
       
    function publishSampleMessage() {
        console.log("Publish on Subscribe");
        var publishConfig = {
            channel : myChannel,
            message : { voteA: votes.voteA, voteB: votes.voteB }
        }
        pubnub.publish(publishConfig, function(status, response) {
            console.log(status, response);
        })
    }
       
    pubnub.addListener({
        status: function(statusEvent) {
            if (statusEvent.category === "PNConnectedCategory") {
                publishSampleMessage();
            }
        },
        message: function(message) {
            console.log("New Message!!");
            if (message.message.voteA > votes.voteA || message.message.voteB > votes.voteB) {
              updateUI(message.message);
            }
        },
        presence: function(presenceEvent) {
            // handle presence
        }
    })      
    console.log("Subscribing..");
    pubnub.subscribe({
        channels: [myChannel] 
    });
};


function subscribeNullVote() {
    var votes = { voteA: $('#vote-count-a').text(), voteB: $('#vote-count-b').text() }
    var myChannel = $('.poll-middle').attr('id');

    pubnub = new PubNub({
        publishKey : 'pub-c-b27cbf1e-2eb7-4afb-a302-a09731c859ac',
        subscribeKey : 'sub-c-65665db6-b825-11e6-b38f-02ee2ddab7fe'
    });

    pubnub.addListener({
        status: function(statusEvent) {
            if (statusEvent.category === "PNConnectedCategory") {
                console.log(statusEvent);
            }
        },
        message: function(message) {
            console.log("New Message!!");
            if (message.message.voteA > votes.voteA || message.message.voteB > votes.voteB) {
              updateUI(message.message);
            }
        }
    })      
    console.log("Subscribing..");
    pubnub.subscribe({
        channels: [myChannel] 
    });
}