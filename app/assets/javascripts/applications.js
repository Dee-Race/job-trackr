// Send a recieve info from the backend without a page reload


// .ready() method waits until the browser finishes rendering the HTML doc before triggering callback function
$(document).ready(() => {
    attachListeners()
});

// Intercept normal routing by the user - rewriting what happends when user clicks applications

// A non refresh of loading all the applications 

const attachListeners = function() {
    $('.all_apps').on('click', function(event) {
        event.preventDefault()
        history.pushState(null, null, "applications") // adds applications to url - /applications
        fetch(`/applications.json`)
            .then(resp => resp.json())
            .then(applications => {
                $('#app-container').html('')
                applications.forEach(application => {
                    let newApplication = new Application(application)
                    let applicationHtml = newApplication.formatIndex()
                    $('#app-container').append(applicationHtml)
                })
            })
    })
}

function Application(application) {
    this.id = application.id
    this.company = application.company
    this.user = application.user 
    this.job_location = application.job_location
    this.description = application.description
    this.job_salary = application.job_salary 
    this.date_applied = application.date_applied
    this.job_url = application.job_url 
}

Application.prototype.formatIndex = function() {
    let applicationHtml = `
        <a href='/applications/${this.id}"><h1>${this.company}</h1>
        <button class="next-application">Next Application</button>
    `
    return applicationHtml 
}