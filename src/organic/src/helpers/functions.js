export function checkElementInViewport(ele, offsetTop) {
  if (ele) {
    const position = ele.getBoundingClientRect();
    let screenHeight = window.innerHeight;

    if (offsetTop) {
      screenHeight -= offsetTop;
    }

    // checking for partial visibility
    if (position.top < screenHeight && position.bottom >= 0) {
      return true;
    }
  }

  // checking whether fully visible
  // if (position.top >= 0 && position.bottom <= window.innerHeight) {
  //   console.log("Element is fully visible in screen");
  // }
  return false;
}
