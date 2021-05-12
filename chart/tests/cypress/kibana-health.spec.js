describe("Basic Kibana", function () {
  it("Check Kibana UI is accessible", function () {
    cy.visit(Cypress.env('kibana_url'))
    cy.title().should("eq", "Elastic")
    cy.get("input[name=username]", { timeout: 15000 })
      .should("be.visible")
      .type("elastic")
      .should("have.value", "elastic");
    cy.get("input[name=password]")
      .type(Cypress.env('elastic_password'))
      .should("have.value", Cypress.env("password"));

    cy.get('button.[type=submit]').click()
    Cypress.on("uncaught:exception", (err, runnable) => {
      // returning false here prevents Cypress from
      // failing the test
      return false;
    });

    // Verify the app redirected you to the homepage
    cy.location("pathname", { timeout: 10000 }).should("eq", "/app/home");

    /*cy.contains("Try our sample data", { timeout: 15000 })
      .should("be.visible")
      .click();
    cy.get("button.euiHeaderSectionItem__button", { timeout: 15000 })
      .first()
      .click();
    cy.contains("Discover", { timeout: 15000 }).click();
    cy.title().should("eq", "Index patterns - Elastic"); */
  });
});
