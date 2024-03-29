/* tslint:disable */
/* eslint-disable */
/**
 * API V1
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: v1
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import type { TodosGet200ResponseItemsInner } from './TodosGet200ResponseItemsInner';
import {
    TodosGet200ResponseItemsInnerFromJSON,
    TodosGet200ResponseItemsInnerFromJSONTyped,
    TodosGet200ResponseItemsInnerToJSON,
} from './TodosGet200ResponseItemsInner';

/**
 * 
 * @export
 * @interface TodosGet200Response
 */
export interface TodosGet200Response {
    /**
     * 
     * @type {Array<TodosGet200ResponseItemsInner>}
     * @memberof TodosGet200Response
     */
    items?: Array<TodosGet200ResponseItemsInner>;
}

/**
 * Check if a given object implements the TodosGet200Response interface.
 */
export function instanceOfTodosGet200Response(value: object): boolean {
    let isInstance = true;

    return isInstance;
}

export function TodosGet200ResponseFromJSON(json: any): TodosGet200Response {
    return TodosGet200ResponseFromJSONTyped(json, false);
}

export function TodosGet200ResponseFromJSONTyped(json: any, ignoreDiscriminator: boolean): TodosGet200Response {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        
        'items': !exists(json, 'items') ? undefined : ((json['items'] as Array<any>).map(TodosGet200ResponseItemsInnerFromJSON)),
    };
}

export function TodosGet200ResponseToJSON(value?: TodosGet200Response | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        
        'items': value.items === undefined ? undefined : ((value.items as Array<any>).map(TodosGet200ResponseItemsInnerToJSON)),
    };
}

