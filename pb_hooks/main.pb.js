router.files("/*", (c) => {
    c.set("Cache-Control", "no-store");
    c.set("Pragma", "no-cache");
    c.set("Expires", "0");
    return c.next();
});
