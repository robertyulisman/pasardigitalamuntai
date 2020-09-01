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
} from './../actions/types';

const initialState = {
  product: [],
  profile: {},
  category: [],
  promo: [],
  sosmed: [],
  konsultasi: [],
  slide: [],
  info: [],
  pembayaran: {},
};

export default function(state = initialState, action) {
  switch (action.type) {
    case GET_PRODUCT:
      return {
        ...state,
        product: action.payload,
      };

    case GET_PROFILE:
      return {
        ...state,
        profile: action.payload,
      };
    case GET_PEMBAYARAN:
      return {
        ...state,
        pembayaran: action.payload,
      };
    case GET_KATEGORI:
      return {
        ...state,
        category: action.payload,
      };
    case GET_KONSULTASI:
      return {
        ...state,
        konsultasi: action.payload,
      };
    case GET_PROMO:
      return {
        ...state,
        promo: action.payload,
      };
    case GET_SLIDE:
      return {
        ...state,
        slide: action.payload,
      };
    case GET_SOSMED:
      return {
        ...state,
        sosmed: action.payload,
      };
    case GET_INFO:
      return {
        ...state,
        info: action.payload,
      };

    default:
      return state;
  }
}
