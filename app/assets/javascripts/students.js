// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function () {
    // Bind the events for adding/removing skills
    $(".remove-skill").bind("ajax:success", removeSkill);
    $(".add-skill").bind("ajax:success", addSkill);
});

/*
    Handler that will trigger when a skill is deleted from the student's skills.
    It's responsible for moving a deleted skill from the list of student's skills
    to the list of available skills and changing its link and inner text.
*/
function removeSkill() {
    // Change the method of the link to PATCH and change the class
    // and inner text.
    $(this).attr("data-method", "patch");
    $(this).removeClass("remove-skill").addClass("add-skill");
    $(this).text("Add");

    // Remove the previous 'removeSkill' event handler and replace it with 'addSkill' handler
    $(this).off();
    $(this).bind("ajax:success", addSkill);

    // Select the parent paragraph element of the link clicked
    const skillParagraphTag = $(this).parent("p");

    // Append the paragraph that contains the link to the 'avaliable skills' Div
    $("#available-skills").append(skillParagraphTag);
}

/*
    Handler that will trigger when a skill is added to the student's skills.
    It's responsible for moving an added skill from the list of available skills
    to the list of student's skills and changing its link and inner text.
*/
function addSkill() {
    // Change the method of the link to DELETE and change the class
    // and inner text.
    $(this).attr("data-method", "delete");
    $(this).removeClass("add-skill").addClass("remove-skill");
    $(this).text("Remove");

    // Remove the previous 'addSkill' event handler and replace it with 'removeSkill' handler
    $(this).off();
    $(this).bind("ajax:success", removeSkill);

    // Select the parent paragraph element of the link clicked
    const skillParagraphTag = $(this).parent("p");

    // Append the paragraph that contains the link to the 'student skills' Div
    $("#student-skills").append(skillParagraphTag);
}
