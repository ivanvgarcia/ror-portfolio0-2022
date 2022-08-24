module.exports = {
  content: [
    "./app/views/**/*.{html,html.haml,haml,html.erb,erb}",
    "./app/views/devise/**/*.{html,html.erb,erb}",
    "./app/frontend/components/**/*.{vue,js,ts,jsx,tsx}",
    "./app/frontend/**/*.{vue,js,ts,jsx,tsx}",
    "./app/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    fontFamily: {
      inter: ["Inter", "sans-serif"],
      montserrat: ["Montserrat", "sans-serif"],
    },
    extend: {},
  },
  plugins: [require("@tailwindcss/forms"), require("@tailwindcss/typography")],
};
