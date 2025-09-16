#!/bin/bash
# This script sets up the entire Eleventy project structure.

echo "🚀 Starting Eleventy project setup..."

# 1. Create all necessary directories
mkdir -p _includes fonts audio
echo "✅ Directories created."

# 2. Create the main layout file: _includes/base-layout.njk
cat > _includes/base-layout.njk << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>
    <header>
        <h1><a href="/">Joey Hershkop</a></h1>
    </header>
    <nav>
        <ul>
            <li><a href="/resume/">Resume</a></li>
            <li><a href="/projects/">Projects</a></li>
            <li><a href="/music/">Music</a></li>
            <li><a href="/photos/">Photos</a></li>
            <li><a href="/blog/">Blog</a></li>
            <li><a href="/contact/">Contact</a></li>
        </ul>
    </nav>
    <main>
        {{ content | safe }}
    </main>
    <footer>
        <p>&copy; 2025 Joey Hershkop</p>
    </footer>
    <script src="/script.js"></script>
</body>
</html>
EOF
echo "✅ _includes/base-layout.njk created."

# 3. Create the homepage: index.md
cat > index.md << 'EOF'
---
layout: base-layout.njk
title: Joey Hershkop's Website
---
Welcome to my official website.
EOF
echo "✅ index.md created."

# 4. Create the music page: music.md
cat > music.md << 'EOF'
---
layout: base-layout.njk
title: My Music
---
## Precipice of Something Great

<audio controls src="/audio/Precipice of Something Great.mp3">
    Your browser does not support the audio element.
</audio>
EOF
echo "✅ music.md created."

# 5. Create the stylesheet: style.css
cat > style.css << 'EOF'
@font-face {
  font-family: 'Apple Garamond';
  src: url('/fonts/AppleGaramond-Light.ttf') format('truetype');
}
html { height: 100%; }
body {
  font-family: 'Apple Garamond', serif;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  margin: 0;
  background-color: #fafafa;
}
main { flex-grow: 1; }
h1 {
  font-size: 10em;
  text-align: left;
  margin-top: 0;
  margin-bottom: 1rem;
  margin-left: 4rem;
  font-weight: normal;
}
h2 {
  font-size: 3em;
  text-align: left;
  margin-top: 0;
  margin-bottom: 0.5em;
  margin-left: 4rem;
}
p {
  font-size: 3em;
  text-align: left;
  margin-top: 0;
  margin-bottom: 0.5em;
  margin-left: 4rem;
}
audio {
  display: block;
  margin-left: 4rem;
  width: 50%;
}
nav { margin-bottom: 5rem; }
nav ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
  margin-left: 4rem;
  display: flex;
  justify-content: left;
  gap: 2rem;
}
nav a {
  text-decoration: none;
  color: #333;
  font-size: 3em;
}
nav a:hover { text-decoration: underline; }
footer {
  margin-right: 4rem;
  margin-bottom: 2rem;
}
footer p {
  text-align: right;
  font-size: 1rem;
  margin-left: 0;
}
h1 a {
  color: inherit;
  text-decoration: none;
}
EOF
echo "✅ style.css created."

# 6. Create the JavaScript file: script.js
cat > script.js << 'EOF'
// This is your JavaScript file for adding interactivity
console.log("Hello from script.js!");
EOF
echo "✅ script.js created."

# 7. Create the Eleventy config file: .eleventy.js
cat > .eleventy.js << 'EOF'
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
EOF
echo "✅ .eleventy.js config created."

echo "\n🎉 All configuration files and directories have been created successfully!"
echo "➡️ IMPORTANT: Now, you just need to manually drag your files:"
echo "   - Drag your font file into the 'fonts' directory."
echo "   - Drag your audio file into the 'audio' directory."