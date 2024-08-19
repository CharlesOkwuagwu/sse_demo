const eventStreamEndpoint = `${window.location.href}/sse`;

async function setupEventSource() {
    console.log(eventStreamEndpoint)
    evtSource = new EventSource(eventStreamEndpoint);

    evtSource.onmessage = (ev) => {
        console.log(ev.data);
    };

    evtSource.onerror = (err) => {
        console.log(err);
        evtSource.close();
    }
}


setupEventSource();