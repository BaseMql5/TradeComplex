//+------------------------------------------------------------------+
//|                                                       Vector.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
/**================================================================================================
 * *                                           Description
 *  Vector class is developed to store data in a dynamic array, Unlike CArray, it can be indexed
 * as normal array and it can be used to store any type of data.
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== class ===========================================*/
template <typename T>
class Vector {
    int m_size;
    int m_capacity;
    T m_data[];

   public:
    Vector()
        : m_size(0), m_capacity(0) {
    }

    const T operator[](const int index) const {
        if (index >= m_size)
            DebugBreak();

        return m_data[index];
    }

    T operator[](const int index) {
        if (index >= m_size)
            DebugBreak();

        return m_data[index];
    }

    void pushBack(T &item) {
        int res = 0;
        if (m_capacity == 0) {
            ArrayResize(m_data, 1);
            res = m_capacity = 1;
        } else if (m_size == m_capacity) {
            m_capacity *= 2;
            res = ArrayResize(m_data, m_capacity);
        }
        m_data[m_size++] = item;
    }

    void Add(T item) {
        pushBack(item);
    }

    void delete(int index) {
        if (index >= m_size)
            DebugBreak();
        delete m_data[index];
        m_size--;
        m_capacity--;
        ArrayRemove(m_data, index, 1);
    }

    int size() const {
        return m_size;
    }

    int Total() const {
        return m_size;
    }

    int last() const {
        return m_size - 1;
    }

    void Clear() {
        while (m_size > 0) {
            Delete(0);
        }

        m_size = 0;
        m_capacity = 0;
        ArrayResize(m_data, 0);
    }

    void LimitSize(int maxSize) {
        if (m_size >= maxSize) {
            int numToRemove = int(m_size / 2);
            for (int i = 0; i < numToRemove; ++i) {
                Delete(0);  // Remove elements from the beginning
            }
        }
    }

    void AddArray(Vector<T> &items) {
        for (int i = 0; i < items.size(); ++i) {
            Add(items[i]);
        }
    }
};
