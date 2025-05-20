/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors:{
        primary: '#F7713D',
        secondary: '#1F1F1F',
        tertiary: '#FFFFFF',
        light_grey:'#EEEEEE',
        dark_grey: '#B3B3B3'
      }
    },
  },
  plugins: [],
}
