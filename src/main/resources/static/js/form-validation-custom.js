$.validator.addMethod("domain", function(value, element) {
    return this.optional(element) || /^http:\/\/mycorporatedomain.com/.test(value);
  }, "Please specify the correct domain for your documents");