"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exceptObjectProp = void 0;
const exceptObjectProp = (obj, exceptsNotation) => {
    const result = {};
    Object.keys(obj).forEach((key) => {
        if (!exceptsNotation.includes(key)) {
            result[key] = obj[key];
        }
    });
    return result;
};
exports.exceptObjectProp = exceptObjectProp;
