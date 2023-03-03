export function getAccountLogin() {
   return JSON.parse(sessionStorage.getItem('accountLogin'));
}

export function setAccountLogin(accountLogin) {
   sessionStorage.setItem('accountLogin', JSON.stringify(accountLogin));
}
