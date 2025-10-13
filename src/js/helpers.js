/**
 * @title Is On Page
 * @description Check if a given node exists in the current DOM
 * @param {Node|Element} node - The HTML Node or Element
 */
export function isOnPage(node) {
	/* If a list of nodes are detected, use the first one */
	if (node instanceof NodeList) node = node[0];

	return node === document.body ? false : document.body.contains(node);
}

/**
 * @title Is Dev?
 * @description Checks whether or not the current environment is the development environment
 */
export function isDev() {
	/* `import.meta.env.MODE` is a special variable built-in to Vite */
	if (import.meta.env.MODE === "development") return true;

	return false;
}

/**
 * @title Is Touch Device
 * @description Determines whether or not the current device uses a touch-based input
 */
export function isTouchDevice() {
	return window.matchMedia("(pointer: coarse)").matches;
}