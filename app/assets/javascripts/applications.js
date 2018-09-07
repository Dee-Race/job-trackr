// Send and recieve info from the backend without a page reload


// .ready() method waits until the browser finishes rendering the HTML doc before triggering callback function
$(document).ready(() => {
    attachListeners();
});

// Intercept normal routing by the user - rewriting what happends when user clicks applications

// A non refresh of loading all the applications 

const attachListeners = function() {
    $('.all_apps').on('click', function(event) {
        event.preventDefault();
        history.pushState(null, null, "applications") // adds applications to url - /applications
        fetch(`/applications.json`)                  // making a call to applications.json api endpoint
            .then(resp => resp.json())                 // returns a promise, calling .json on response
            .then(applications => {                   // getting back the data from the previous then response
                $('#app-container').html('')          // clearing app container html
                applications.forEach(application => {     // iterating through each application
                    let newApplication = new Application(application) // create new application object with attributes
                    let applicationHtml = newApplication.formatIndex()  // calling new application on prototype
                    $('#app-container').append(applicationHtml)
                })
            })
    })
    $(document).on('click', ".show_link", function(event) {
        event.preventDefault()
        let id = $(this).attr('data-id')
        fetch(`/applications/${id}.json`)
            .then(resp => resp.json())
            .then(application => {
                let newApplication = new Application(application)
                let applicationHtml = newApplication.formatShow()
                $('#app-container').append(applicationHtml)
            })
    })
}

function Application(application) {   // javascript model object, constructor function 
    this.id = application.id
    this.company = application.company
    this.user = application.user 
    this.job_title = application.job_title.title
    this.job_location = application.job_location
    this.description = application.description
    this.job_salary = application.job_salary 
    this.date_applied = application.date_applied
    this.job_url = application.job_url 
    this.comments = application.comments
}

Application.prototype.formatIndex = function() {     //
    let applicationHtml = `
        <a href="/applications/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.company}</h1></a>
    `
    return applicationHtml 
}

Application.prototype.formatShow = function() {
    let applicationHtml = `<ol>
        <li><p>${this.job_title}</p></li>
        <li><p>${this.description}</p></li>
        <li><p>${this.job_location}</p></li>
        <li><p>${this.job_url}</p></li>
        </ol>
    `
    return applicationHtml
}


$(function () {
    $(".js-next").on("click", function() {
        var nextId = parseInt($(".js-next").attr("data-id")) + 1;
        $.get("/applications/" + nextId + ".json", function(data) {
            var application = data;
            $(".applicationCompany").text(application["company"]);
            $(".applicationJobTitle").text(application["job_title.title"]);
            $(".applicationLocation").text(application["job_location"]);
            $(".applicationJobSalary").text(application["job_salary"]);
            $(".applicationJobUrl").text(application["job_url"]);
            $(".applicationDescription").text(application["description"]);
            $(".applicationDateApplied").text(application["date_applied"]);
             //re-set the id to current on the link
            $(".js-next").attr("data-id", application["id"]);
        });
    });
});

