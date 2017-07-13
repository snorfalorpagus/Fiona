from fiona.ogrext2 cimport OGR_F_IsFieldSet

cdef bint is_field_null(void *feature, int n):
    if not OGR_F_IsFieldSet(feature, n):
        return True
    else:
        return False
