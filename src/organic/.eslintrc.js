module.exports = {
	root: true,
	env: {
		node: true,
	},
	extends: ["plugin:vue/vue3-essential", "@vue/standard"],
	parserOptions: {
		parser: "@babel/eslint-parser",
	},
	rules: {
		"no-console": process.env.NODE_ENV === "production" ? "warn" : "off",
		"no-debugger": process.env.NODE_ENV === "production" ? "warn" : "off",
		// enable additional rules
		indent: "off",
		quotes: "off",
		semi: ["error", "always"],
		"comma-dangle": "off",
		"no-inline-comments": "off",
		"no-tabs": "off",
		"no-unused-vars": ["warn"],
		"space-before-function-paren": "off",
		// override configuration set by extending "eslint:recommended"
		"init-declarations": "off",
		"no-cond-assign": ["error", "always"],
		// disable rules from base configurations
		"for-direction": "off",
	},
};
