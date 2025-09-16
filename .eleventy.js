module.exports = function(eleventyConfig) {
  // Passthrough Copy: Copy CSS, fonts, audio, and JS to the output folder
  eleventyConfig.addPassthroughCopy("style.css");
  eleventyConfig.addPassthroughCopy("fonts");
  eleventyConfig.addPassthroughCopy("audio");
  eleventyConfig.addPassthroughCopy("script.js");

  return {
    // When a passthrough file is modified, rebuild the site
    passthroughFileCopy: true
  };
};
