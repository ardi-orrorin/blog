// extends를 통한 제네릭 타입 제약

function ontext<T extends string>(text: T){
    return text;
}

ontext<string>('문자열');

function offtext<T extends {length: number }>(value: T){
    console.log(value);
    return value.length;
}

console.log(offtext('test'));
console.log(offtext(['','']));

// negeric 제약조건에 포함된 내용이 있다면 사용가능
// 이외의 값은 반환 할 수 없다.
console.log(offtext({title:'123', length:3}));


