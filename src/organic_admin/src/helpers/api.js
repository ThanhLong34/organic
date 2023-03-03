import { ElMessage } from "element-plus";

export function get(url, params = {}, resolveCallback, rejectCallback) {
   let api = url;

   if (typeof params === 'object' && params !== null) {
      api += "?";
      Object.entries(params).forEach(([key, value]) => {
         api += `${key}=${value}&`;
      })
   }

   return fetch(api, {
      method: "GET",
   })
      .then(response => response.json())
      .then(data => {
         resolveCallback(data);
         if (data.code === 9) {
            ElMessage({
               message: data.message,
               type: "error",
            });
         }
      })
      .catch(error => rejectCallback(error));
}

export function post(url, payload = {}, resolveCallback, rejectCallback) {
   let api = url;

   return fetch(api, {
      method: "POST",
      body: JSON.stringify(payload),
   })
      .then(response => response.json())
      .then(data => {
         resolveCallback(data);
         if (data.code === 9) {
            ElMessage({
               message: data.message,
               type: "error",
            });
         }
      })
      .catch(error => rejectCallback(error));
}

export function put(url, payload = {}, resolveCallback, rejectCallback) {
   let api = url;

   return fetch(api, {
      method: "PUT",
      body: JSON.stringify(payload),
   })
      .then(response => response.json())
      .then(data => {
         resolveCallback(data);
         if (data.code === 9) {
            ElMessage({
               message: data.message,
               type: "error",
            });
         }
      })
      .catch(error => rejectCallback(error));
}

export function deleteByID(url, id, resolveCallback, rejectCallback) {
   let api = url;

   return fetch(api, {
      method: "PUT",
      body: JSON.stringify({
         id
      }),
   })
      .then(response => response.json())
      .then(data => {
         resolveCallback(data);
         if (data.code === 9) {
            ElMessage({
               message: data.message,
               type: "error",
            });
         }
      })
      .catch(error => rejectCallback(error));
}

export function uploadFile(url, formData = new FormData(), resolveCallback, rejectCallback) {
   let api = url;

   return fetch(api, {
      method: "POST",
      body: formData,
   })
      .then(response => response.json())
      .then(data => {
         resolveCallback(data);
         if (data.code === 9) {
            ElMessage({
               message: data.message,
               type: "error",
            });
         }
      })
      .catch(error => rejectCallback(error));
}
