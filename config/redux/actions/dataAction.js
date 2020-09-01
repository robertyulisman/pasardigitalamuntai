import axios from 'axios';
import {
  GET_PRODUCT,
  GET_PROFILE,
  GET_KATEGORI,
  GET_PROMO,
  GET_SLIDE,
  GET_SOSMED,
  GET_KONSULTASI,
  GET_INFO,
  GET_PEMBAYARAN,
} from './types';

// https://app.pasardigitalamuntai.com/slide

export const getCategory = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/kategori')
    .then(response => {
      dispatch({
        type: GET_KATEGORI,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_KATEGORI,
        payload: {},
      }),
    );
};

export const getProduct = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/produk')
    .then(response => {
      dispatch({
        type: GET_PRODUCT,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_PRODUCT,
        payload: {},
      }),
    );
};

export const getProfile = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/profile')
    .then(response => {
      dispatch({
        type: GET_PROFILE,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_PROFILE,
        payload: {},
      }),
    );
};

export const getKonsultasi = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/konsultasi')
    .then(response => {
      dispatch({
        type: GET_KONSULTASI,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_KONSULTASI,
        payload: {},
      }),
    );
};

export const getPomo = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/promo')
    .then(response => {
      dispatch({
        type: GET_PROMO,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_PROMO,
        payload: {},
      }),
    );
};

export const getInfo = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/info')
    .then(response => {
      dispatch({
        type: GET_INFO,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_INFO,
        payload: {},
      }),
    );
};

export const getSlide = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/slide')
    .then(response => {
      dispatch({
        type: GET_SLIDE,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_SLIDE,
        payload: {},
      }),
    );
};

export const getSosmed = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/sosmed')
    .then(response => {
      dispatch({
        type: GET_SOSMED,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_SOSMED,
        payload: {},
      }),
    );
};

export const getPembayaran = () => dispatch => {
  axios
    .get('https://app.pasardigitalamuntai.com/pembayaran')
    .then(response => {
      dispatch({
        type: GET_PEMBAYARAN,
        payload: response.data,
      });
    })
    .catch(err =>
      dispatch({
        type: GET_PEMBAYARAN,
        payload: {},
      }),
    );
};
