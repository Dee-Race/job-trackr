$(() => {
    attachListeners()
})

const attachListeners = function() {
    $('.all_apps').on('click', function(event) {
        event.preventDefault()
        fetch(`/applications.json`)
            .then(resp => resp.json())
            .then(applications => {
                $('#app-container').html('')
                applications.forEach(application => {
                    let newApplication = new Application(application)
                    console.log(newApplication)
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